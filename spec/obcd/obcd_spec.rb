require 'spec_helper'

describe Obcd do
  context 'find' do
    before :each do
      @binary = File.expand_path(File.join(__FILE__, '../../../bin/obcd'))
      @fixtures = File.expand_path(File.join(__FILE__, '../../fixtures'))
    end
    describe '#help' do
      it 'displays help' do
        help = `"#{@binary}" help`
        help.should include 'obcd - Deal with obsessive compulsive issues of programmers in Objective-C'
      end
      it 'displays a list of checks' do
        output = `"#{@binary}" help find`
        output.should include 'Available checks:'
        output.should include "- HeaderStyle: #{Obcd::Checks::HeaderStyle.desc}"
        output.should include "- SpectaFocus: #{Obcd::Checks::SpectaFocus.desc}"
      end
    end
    describe '#find' do
      it 'displays an error when no checks are specified' do
        output = `"#{@binary}" find 2>&1`
        output.should eq "Please specify at least one check. Run 'obcd help find' for a list.\n"
      end
      context 'HeaderStyle' do
        it 'finds violations in a single file' do
          output = `"#{@binary}" --path="#{@fixtures}/HeaderStyle/WrongExtension.m" find HeaderStyle 2>&1`
          output.chomp.should eq [
            'WrongExtension.m: 1 violation',
            "#{@fixtures}/HeaderStyle/WrongExtension.m:2:1: warning: HeaderStyle: Filename extension doesn't match, expected .m, got .h.",
            'Found 1 violation.'
          ].join("\n")
        end
        it 'finds multiple violations in a single file' do
          output = `"#{@binary}" --path="#{@fixtures}/HeaderStyle/MissingFilenameAndBlankAfterCompanyName.h" find HeaderStyle 2>&1`
          output.chomp.should eq [
            'MissingFilenameAndBlankAfterCompanyName.h: 2 violations',
            "#{@fixtures}/HeaderStyle/MissingFilenameAndBlankAfterCompanyName.h:2:1: warning: HeaderStyle: Filename extension doesn't match, expected .h, got .",
            "#{@fixtures}/HeaderStyle/MissingFilenameAndBlankAfterCompanyName.h:4:1: warning: HeaderStyle: Expected a blank // after company name.",
            'Found 2 violations.'
          ].join("\n")
        end
        it 'finds violations in multiple files' do
          output = `"#{@binary}" --path="#{@fixtures}/HeaderStyle" find HeaderStyle 2>&1`
          output.split("\n").last.should == 'Found 9 violations.'
        end
      end
    end
  end
end
