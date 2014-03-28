require 'spec_helper'

describe Obcd::Checks::HeaderStyle do
  before :each do
    @fixtures = File.expand_path(File.join(__FILE__, '../../../fixtures/HeaderStyle'))
  end
  it "doesn't find any violations in a valid .h file" do
    Obcd::Checks::HeaderStyle.check(File.join(@fixtures, 'Valid.h')).should be_empty
  end
  it "doesn't find any violations in a valid .m file" do
    Obcd::Checks::HeaderStyle.check(File.join(@fixtures, 'Valid.m')).should be_empty
  end
  it 'finds a wrong extension violation' do
    violations = Obcd::Checks::HeaderStyle.check(File.join(@fixtures, 'WrongExtension.m'))
    violations.count.should eq 1
    violations[0].to_s.should eq "line 2: Filename extension doesn't match, expected .m, got .h."
  end
  it 'finds a wrong filename violation' do
    violations = Obcd::Checks::HeaderStyle.check(File.join(@fixtures, 'WrongFilename.h'))
    violations.count.should eq 1
    violations[0].to_s.should eq 'line 2: Expected header to include file name, instead got //  ThisFilenameIsWrong.h.'
  end
  ['MissingCopyright.h', 'MissingFilename.h', 'MissingSlashSlash.h', 'MissingTrailingSlashSlash.h'].each do |filename|
    it "finds that the number of lines in header doesn't match in #{filename}" do
      violations = Obcd::Checks::HeaderStyle.check(File.join(@fixtures, filename))
      violations.count.should eq 1
      violations[0].to_s.should eq "line 1: Number of lines in header doesn't match."
    end
  end
end
