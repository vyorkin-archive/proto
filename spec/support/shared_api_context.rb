shared_context 'api', :api do
  attr_reader :hash

  subject { response }

  before do
    @hash = {
      :x => 1,
      :y => 'string',
      :hash => { :x => true, :y => DateTime.now }
    }
  end
end
