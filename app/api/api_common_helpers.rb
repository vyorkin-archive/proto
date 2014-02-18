module APICommonHelpers
  def access_denied!(message = 'Access denied')
    error! message, 401
  end

  def bad_request!(message = 'Bad request')
    error! message, 400
  end

  def forbidden_request!(message = 'Forbidden')
    error! message, 403
  end

  def not_found!(message = 'Not found')
    error! message, 404
  end

  def invalid_request!(message = 'Invalid request')
    error! message, 422
  end

  def try_create!(klass, *attrs)
    try_save!(klass.new(extract_attributes(attrs)))
  end

  def try_update!(klass, id_key, *attrs)
    record = try_find(klass, id_key)
    update!(klass, attrs)
  end

  def try_save!(record)
    unless record.save
      bad_request!(record.errors.map(&:message).join(', '))
    end
    record
  end

  def try_find(klass, id_key, param_key = id_key)
    record = klass.find_by(id_key => params[param_key])
    model_not_found!(klass, id_key) unless record.present?
    record
  end

  def try_destroy!(klass, id_key)
    destroy!(try_find(klass, id_key))
  end

  def update!(record, *attrs)
    unless record.update_attributes(extract_attributes(attrs))
      bad_request!(record.errors.full_messages.join('. '))
    end
    record
  end

  def destroy!(record)
    record.destroy
    status 204
  end

  def safe_params
    declared(params, include_missing: false)
  end

  protected

  def model_not_found!(klass, id_key)
    model_name = I18n.t(klass.to_s.downcase, scope: 'activerecord.models')
    not_found! "Запись типа #{klass} (#{model_name}) с #{id_key} = #{params[id_key]} не найдена"
  end

  private

  def extract_attributes(attrs)
    Hash[attrs.map { |attr| [attr, safe_params[attr]] }]
  end
end
