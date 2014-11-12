# Ddr::Extractor

Generic file text and metadata extraction service.

## Installation

Add this line to your application's Gemfile:

    gem 'ddr-extractor'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ddr-extractor

## Usage

```
>> extractor = Ddr::Extraction::Extractor.new
=> #<Ddr::Extraction::Extractor:0x007fc2851dcfa0>

>> text = extractor.extract(:text, "spec/fixtures/sample.docx")
=> #<IO:fd 11>

>> puts text.read
This is a sample document.

>> metadata = extractor.extract(:metadata, "spec/fixtures/blue-devil.png")
=> #<IO:fd 12>

>> puts metadata.read
<?xml version="1.0" encoding="UTF-8"?>
<fits xmlns="http://hul.harvard.edu/ois/xml/ns/fits/fits_output" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://hul.harvard.edu/ois/xml/ns/fits/fits_output http://hul.harvard.edu/ois/xml/xsd/fits/fits_output.xsd" version="0.8.3" timestamp="11/12/14 12:36 PM">
  <identification>
    <identity format="Portable Network Graphics" mimetype="image/png" toolname="FITS" toolversion="0.8.3">
      <tool toolname="Exiftool" toolversion="9.13" />
      <tool toolname="Droid" toolversion="6.1.3" />
      <tool toolname="ffident" toolversion="0.2" />
      <tool toolname="Tika" toolversion="1.3" />
      <version toolname="Droid" toolversion="6.1.3">1.0</version>
      <externalIdentifier toolname="Droid" toolversion="6.1.3" type="puid">fmt/11</externalIdentifier>
    </identity>
  </identification>
  <fileinfo>
    <lastmodified toolname="Exiftool" toolversion="9.13" status="SINGLE_RESULT">2014:11:12 12:24:18-05:00</lastmodified>
    <filepath toolname="OIS File Information" toolversion="0.2" status="SINGLE_RESULT">/path/to/spec/fixtures/blue-devil.png</filepath>
    <filename toolname="OIS File Information" toolversion="0.2" status="SINGLE_RESULT">blue-devil.png</filename>
    <size toolname="OIS File Information" toolversion="0.2" status="SINGLE_RESULT">75005</size>
    <md5checksum toolname="OIS File Information" toolversion="0.2" status="SINGLE_RESULT">e6a5d16da2fbe65311952e2d8b04f069</md5checksum>
    <fslastmodified toolname="OIS File Information" toolversion="0.2" status="SINGLE_RESULT">1415813058000</fslastmodified>
  </fileinfo>
  <filestatus />
  <metadata>
    <image>
      <compressionScheme toolname="Exiftool" toolversion="9.13" status="CONFLICT">Deflate/Inflate</compressionScheme>
      <compressionScheme toolname="Tika" toolversion="1.3" status="CONFLICT">Deflate</compressionScheme>
      <imageWidth toolname="Exiftool" toolversion="9.13">200</imageWidth>
      <imageHeight toolname="Exiftool" toolversion="9.13">200</imageHeight>
      <orientation toolname="Tika" toolversion="1.3" status="SINGLE_RESULT">normal*</orientation>
    </image>
  </metadata>
  <statistics fitsExecutionTime="791">
    <tool toolname="OIS Audio Information" toolversion="0.1" status="did not run" />
    <tool toolname="ADL Tool" toolversion="0.1" status="did not run" />
    <tool toolname="Jhove" toolversion="1.5" executionTime="556" />
    <tool toolname="file utility" toolversion="5.04" executionTime="623" />
    <tool toolname="Exiftool" toolversion="9.13" executionTime="664" />
    <tool toolname="Droid" toolversion="6.1.3" executionTime="147" />
    <tool toolname="NLNZ Metadata Extractor" toolversion="3.4GA" executionTime="366" />
    <tool toolname="OIS File Information" toolversion="0.2" executionTime="142" />
    <tool toolname="OIS XML Metadata" toolversion="0.2" status="did not run" />
    <tool toolname="ffident" toolversion="0.2" executionTime="369" />
    <tool toolname="Tika" toolversion="1.3" executionTime="356" />
  </statistics>
</fits>
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ddr_extractor/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
