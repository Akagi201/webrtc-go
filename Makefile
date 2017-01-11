##############################################################################
# @file Makefile
# @date 2016-12-21
# @author Akagi201 <akagi201@gmail.com>
# @license MIT
##############################################################################
TARGET := webrtc

all:
	cgogen $(TARGET).yml
	goimports -w .

clean:
	rm -f $(TARGET)/cgo_helpers.go $(TARGET)/cgo_helpers.h $(TARGET)/cgo_helpers.c
	rm -f $(TARGET)/const.go $(TARGET)/doc.go $(TARGET)/types.go
	rm -f $(TARGET)/$(TARGET).go

test:
	cd $(TARGET) && go build

.PHONY: all clean test
