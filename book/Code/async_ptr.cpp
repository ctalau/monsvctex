template <typename T>
template <typename R, typename... Args>
void async_ptr<T>::async(R (T::*fn)(Args...), Args... args);

