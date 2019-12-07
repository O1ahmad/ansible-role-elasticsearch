title "Elasticsearch jvm.options configuration test suite"

describe file('/opt/elasticsearch/config/jvm.options') do
  it { should exist }
  its('owner') { should eq 'elasticsearch' }
  its('group') { should eq 'elasticsearch' }
  its('mode') { should cmp '0644' }

  its('content') { should match("set the min and max JVM heap size") }
  its('content') { should match("-Xms1g") }
  its('content') { should match("-Xmx1g") }
end
