require "status_code_info"
require "formatter"

describe Formatter do
    it "properly formats the status code info" do
        input = StatusCodeInfo.new(725, "It works on my machine", "http://tddapps.com/logo.png")
        expected = %{---
title: 725 It works on my machine
permalink: /725
---
<div class="status-page-container">
<div>
    <img src="http://tddapps.com/logo.png" alt="725 It works on my machine" />
    <h1>725</h1>
    <h2>It works on my machine</h2>
</div>
</div>
}

        output = Formatter.format(input)

        expect(output).to eq expected
    end
end