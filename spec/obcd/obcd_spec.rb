require 'spec_helper'

describe Obcd do
  context "find" do
    before :each do
      @binary = File.expand_path(File.join(__FILE__, '../../../bin/obcd'))
      @fixtures = File.expand_path(File.join(__FILE__, '../../fixtures'))
    end
    describe "#help" do
      it "displays help" do
        help = `"#{@binary}" help`
        help.should include "obcd - Deal with obsessive compulsive issues of programmers in Objective-C"
      end
      it "displays a list of checks" do
        output = `"#{@binary}" help find`
        output.should include "Available checks:"
        output.should include "- HeaderStyle: #{Obcd::Checks::HeaderStyle.desc}"
      end
    end
    describe "#find" do
      it "displays an error when no checks are specified" do
        output = `"#{@binary}" find 2>&1`
        output.should eq "Please specify at least one check. Run 'obcd help find' for a list.\n"
      end
      context "HeaderStyle" do
        pending "TODO"
      end
    end
  end
end
