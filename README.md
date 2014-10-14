# IPInsetLabel
A simple UILabel subclass that adds padding insets, auto-height-resizing, and vertical alignment.

From https://gist.github.com/marcoarment/2596057 and @soffes/SAMLabel

With modifications from comments

Wrapped into a Cocoapod on GitHub for easy installation and collaborative sustainability


[![CI Status](http://img.shields.io/travis/Charles Phillips/IPInsetLabel.svg?style=flat)](https://travis-ci.org/Charles Phillips/IPInsetLabel)
[![Version](https://img.shields.io/cocoapods/v/IPInsetLabel.svg?style=flat)](http://cocoadocs.org/docsets/IPInsetLabel)
[![License](https://img.shields.io/cocoapods/l/IPInsetLabel.svg?style=flat)](http://cocoadocs.org/docsets/IPInsetLabel)
[![Platform](https://img.shields.io/cocoapods/p/IPInsetLabel.svg?style=flat)](http://cocoadocs.org/docsets/IPInsetLabel)

## Usage

    self.insetLabel.insets = UIEdgeInsetsMake(8, 16, 12, 16); // top, left, bottom, right
    self.insetLabel.verticalTextAlignment = UIControlContentVerticalAlignmentBottom;

## Requirements

## Installation

IPInsetLabel is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "IPInsetLabel"

## Author

@marcoarment
@jeebster
@bomalley
@danomatika
@soffes
@doublerebel

## License

Copyright 2011 Instapaper LLC, released to the public domain.
