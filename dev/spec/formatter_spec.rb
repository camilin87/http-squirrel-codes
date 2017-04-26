require "status_code_info"
require "formatter"

describe Formatter do
    it "properly formats the status code info" do
        input = StatusCodeInfo.new(725, "It works on my machine", "http://tddapps.com/logo.png")
        expected = %{---
title: 725 - It works on my machine
permalink: /725/
---
![725 - It works on my machine](http://tddapps.com/logo.png)  
\# 725  
\#\# It works on my machine  
}

        output = Formatter.format(input)

        expect(output).to eq expected
    end
end