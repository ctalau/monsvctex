def lock(): 
    obj_lock.lock()
    with qlock: update_queue.execute_all()

def unlock(): 
    with qlock: 
        update_queue.execute_all()
        obj_lock.unlock()

def async(f, args)
    with qlock:
        if obj_lock.try_lock():
            update_queue.execute_all()
            f(args)
            obj_lock.unlock()
        else: update_queue.append((f, args))

