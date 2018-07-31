describe 'HTTParty' do
    # ':vcr' is a sofisticated method to use
    #it 'HTTparty does', vcr: { cassette_name: 'jsonplaceholder/posts', match_requests_on: [:body], :record => :new_episodes} do
    it 'HTTparty does', vcr: { cassette_name: 'jsonplaceholder/posts', :record => :new_episodes } do
    #it 'content-type', :vcr do
      #method to do, if just webmock be used
      #stub_request(:get, 'https://jsonplaceholder.typicode.com/posts/2').
      #to_return(status: 200, body: "", headers: {'content-type': 'application/json'})
     # it 'content-type' do
     # VCR.use_cassette("jsonplaceholder/posts") do   
      response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
      aux = response.headers['content-type']
      expect(aux).to match(/application\/json/)  
     end
    #end
    
end