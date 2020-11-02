module ApplicationHelper

    def current_class?(test_path)
        request.path == test_path ? 'nav-link active' : 'nav-link'
    end

end
