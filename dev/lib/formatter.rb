class Formatter
    def self.format(status_code_info)
        %{---
type: page
layout: page
title: #{status_code_info.full_name}
permalink: /#{status_code_info.code}/
---

<img src="#{status_code_info.url}" alt="#{status_code_info.full_name}" />
}
    end
end