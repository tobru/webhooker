require 'base64'
require_relative 'test_helper'

describe 'GET /' do
  it 'should request authentication' do
    get '/'
    last_response.status.must_equal 401
  end
  it 'should respond with authentication' do
    authorize "deployer", "Deploy1T"
    get '/'
    assert last_response.ok?
    assert last_response.body.must_match "I'm running. Nice, isn't it?"
  end
end

describe 'Bitbucket payload' do
  it 'should do sth' do
    authorize "deployer", "Deploy1T"
    post '/payload/bitbucket', 'payload' => '%7B%22repository%22%3A %7B%22website%22%3A %22%22%2C %22fork%22%3A false%2C %22name%22%3A %22puppet-control%22%2C %22scm%22%3A %22git%22%2C %22owner%22%3A %22evaultch%22%2C %22absolute_url%22%3A %22%2Fevaultch%2Fpuppet-control%2F%22%2C %22slug%22%3A %22puppet-control%22%2C %22is_private%22%3A true%7D%2C %22truncated%22%3A false%2C %22commits%22%3A %5B%7B%22node%22%3A %22634d71461df8%22%2C %22files%22%3A %5B%7B%22type%22%3A %22modified%22%2C %22file%22%3A %22hooktest.txt%22%7D%5D%2C %22raw_author%22%3A %22Tobias Brunner %3Ctobias%40wuala.com%3E%22%2C %22utctimestamp%22%3A %222014-12-03 16%3A04%3A36%2B00%3A00%22%2C %22author%22%3A %22tobru%22%2C %22timestamp%22%3A %222014-12-03 17%3A04%3A36%22%2C %22raw_node%22%3A %22634d71461df82f2095f18955cf967b606cb25f84%22%2C %22parents%22%3A %5B%22d94b7645874e%22%5D%2C %22branch%22%3A %22production%22%2C %22message%22%3A %22hook test 3%5Cn%22%2C %22revision%22%3A null%2C %22size%22%3A -1%7D%5D%2C %22canon_url%22%3A %22https%3A%2F%2Fbitbucket.org%22%2C %22user%22%3A %22tobru%22%7D'
    assert last_response.ok?
    assert last_response.body.must_match "it's coming from bitbucket"
  end
end
