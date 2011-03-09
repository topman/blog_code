class BaseView(object):
    def __init__(self):
        pass

    def get_urls(self):
        return "hello"

    urls = property(get_urls)

view = BaseView().urls
print view
