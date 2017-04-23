require "status_code_info"
require "formatter"

describe Formatter do
    it "properly formats the status code info" do
        input = StatusCodeInfo.new(725, "It works on my machine", "http://tddapps.com/logo.png")
        expected = %{---
type: page
layout: page
title: 725 - It works on my machine
permalink: /725/
---

<img src="http://tddapps.com/logo.png" alt="725 - It works on my machine" />
}

        output = Formatter.format(input)

        expect(output).to eq expected
    end
end