class AccessConstraints

    def initialize(options)
        @version = options[:version]
        @default = options[:default]
    end

    def matches?(req)
        @default
    end

end
