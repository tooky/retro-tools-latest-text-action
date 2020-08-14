TESTS:=$(wildcard tests/*.sh)
BUILDDIR:=tmp

.docker-build: Dockerfile entrypoint.sh
	docker build -t retro-tools-action-test .
	@touch $@

check: $(TESTS:tests/%.sh=$(BUILDDIR)/tests/%.diff)
	@echo SUCCESS

$(BUILDDIR)/tests/%.diff: $(BUILDDIR)/tests/%.output tests/%.expected
	@diff --side-by-side $^ > $@ || ! cat $@

$(BUILDDIR)/tests/%.output: tests/%.sh tests/%.expected
	@echo TEST: $*
	@rm -rf $(dir $@)/$*
	@mkdir -p $(dir $@)/$*
	@(cd $(dir $@)/$* && \
	  PATH=/bin:/usr/bin:/usr/local/bin:$(abspath bin):$(abspath tests) \
	  PS4='+ ' \
	    /bin/sh -v $(abspath $<) > $(abspath $@) 2>&1) || ! cat $@

.PHONY: build check
build: .docker-build


clean:
	rm -rf $(BUILDDIR)

.PHONY: all clean
.PRECIOUS: $(BUILDDIR)/tests/%.output
.DELETE_ON_ERROR:
