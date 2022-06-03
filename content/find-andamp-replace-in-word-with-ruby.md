---
date: 2007-11-12
layout: post
title: Find &amp; Replace in Word with Ruby
tags: []
status: publish
type: post
published: true
meta: {}
---

You can script Microsoft Word using COM and the Ruby `win32ole` library.

First, create a plain Word document with text to replace like this:

> Here is some text of my document. This will be replaced with [name]. Today's date is: [date].

Then, run the following code. The text in square brackets will be replaced with the values in the code, and the file will be saved as a new name.

```
require 'win32ole'
word = WIN32OLE.new('Word.Application')
#word.Visible = true # uncomment if you want to see it happen
doc = word.Documents.Open('c:\file_to_open.doc')

replacements = {
  'name' => 'Tim Morgan',
  'date' => Date.today.strftime('%B %d, %Y')
}

replacements.each do |key, value|
  word.Selection.HomeKey(unit=6) # start at beginning
  find = word.Selection.Find
  find.Text = "[#{key}]" # text must be in square brackets
  while word.Selection.Find.Execute
    word.Selection.TypeText(text=value)
  end
end

doc.SaveAs('c:\output_file.doc')
doc.Close
```
