module LeadsHelper

def agent_select_options(lead)
options_for_select([['', nil]] + Agent.order(:name).all.collect {|a| [a.name, a.id]}, allow_blank: true, selected: lead.agent_id)
end

end



