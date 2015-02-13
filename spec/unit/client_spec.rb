module Ddr
  module FileTools
    RSpec.describe Client do
  
      describe "extracting text" do
        let(:file_path) { File.expand_path("../../fixtures/sample.docx", __FILE__) }
        it "should extract the text content of the file" do
          expect(subject.run_tool(:text, file_path).output).to match(/This is a sample document./)
        end
      end

      describe "extracting metadata" do
        let(:file_path) { File.expand_path("../../fixtures/blue-devil.png", __FILE__) }
        it "should extract technical metadata from the file" do
          expect(subject.run_tool(:metadata, file_path).output.length).to_not eq(0)
        end
      end

    end
  end    
end
