   json.array! @leads do |lead|

    json.name               @lead.name
    json.email              @lead.email
    json.phone              @lead.phone
    json.address            @lead.address
    json.agent_id           @lead.agent_id
    json.search_count       @lead.search_count
    json.last_search        @lead.last_search
    json.start_date         @lead.start_date
    json.active_at          @lead.active_at
    json.created_at         @lead.created_at
    json.updated_at         @lead.updated_at
    json.activity_log       @lead.activity_log

end
