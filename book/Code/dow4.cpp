void do_work(async_ptr<histo> h) { 
    ... h.lock(); do_legacy_work(h.get()); h.unlock(); ...
}

