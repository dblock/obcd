require 'spec_helper'

describe Obcd::Checks::SpectaFocus do
  before :each do
    @fixtures = File.expand_path(File.join(__FILE__, '../../../fixtures/SpectaFocus'))
  end
  it "doesn't find any violations in a valid spec file" do
    Obcd::Checks::SpectaFocus.check(File.join(@fixtures, 'ValidSpec.m')).should be_empty
  end
  it "finds instances of 'fcontext(@\"'" do
    violations = Obcd::Checks::SpectaFocus.check(File.join(@fixtures, 'FocusedSpec.m'))
    violations[0].to_s.should eq 'line 5: Unexpected fcontext(…) found.'
  end
  it "finds instances of 'fdescribe(@\"'" do
    violations = Obcd::Checks::SpectaFocus.check(File.join(@fixtures, 'FocusedSpec.m'))
    violations[1].to_s.should eq 'line 6: Unexpected fdescribe(…) found.'
  end
  it "finds instances of 'fexample(@\"'" do
    violations = Obcd::Checks::SpectaFocus.check(File.join(@fixtures, 'FocusedSpec.m'))
    violations[2].to_s.should eq 'line 7: Unexpected fexample(…) found.'
  end
  it "finds instances of 'fit(@\"'" do
    violations = Obcd::Checks::SpectaFocus.check(File.join(@fixtures, 'FocusedSpec.m'))
    violations[3].to_s.should eq 'line 9: Unexpected fit(…) found.'
  end
  it "finds instances of 'fspecify(@\"'" do
    violations = Obcd::Checks::SpectaFocus.check(File.join(@fixtures, 'FocusedSpec.m'))
    violations[4].to_s.should eq 'line 11: Unexpected fspecify(…) found.'
  end
  it 'finds focused specs with inconsistent formatting.' do
    violations = Obcd::Checks::SpectaFocus.check(File.join(@fixtures, 'InconsistentlyFormattedSpec.m'))
    violations[0].to_s.should eq 'line 4: Unexpected fdescribe(…) found.'
    violations[1].to_s.should eq 'line 5: Unexpected fit(…) found.'
  end
end
