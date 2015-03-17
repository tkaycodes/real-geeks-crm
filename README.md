#Real Geeks Rails Programmer Interview Project

###Task1:
```shell
An API endpoint for creating leads, to receive new leads, from our other services
```
###Notes: 
Created a new controller for APIs,and a subfolder inside there - v1. Inside the api controller, i added three actions(show, index and create). I started off with the show and index actions, just to see if my method was working. ( I also created views for these in the views folder). Perhaps they can be of value? Then I went ahead and created the create action. I tested this using POSTMAN ( chrome extension). It works, obeying the "round robin" agent clause.

This was one of the more difficult parts of this test for me. I had made show and index actions for apis once before, but the create action was completely new to me. I was a bit worried that the "round robin" wouldnt work when posting from API, but it did!

###Task2:
```shell
 On the lead detail page (LeadsController#show) restrict the ability for regular agents to change who the lead is assigned to. It should only be allowed to admins
```
###Notes:
I added a simple if statement checking to see if the agent role is admin. If  it is, then show the next part of the code. I later refactored this into a helper method called agent? inside the agent.rb file.

I found this task relatively simple, and finished it quickly. Agents cwere created using rails console. I was going to include a "sign up" button, but I thought it was probably left out for a reason, and decided not to implement it.

###Task3:
```shell
 Allow admin agents to change who the lead is assigned to from the leads list page(LeadsController#index) using a select dropdown type menu. This should update the server without reloading the page and give some sort of visual indication that the reassignment was successful.
```
###Notes:
First I added a dropdown options (similar to how its set up inside the leads show page), and added a submit button. On click, the page reloaded and it updated the agent. (Using the update action inside the controller) Once this was done, in order to ensure that the page was not reloaded, i added remote:true inside the form, so it would process the submit as an ajax request. Then i created an update.js file. Inside the newly created file, I added alert("agent udpated") to let the user know that the agent was updated. Then I decided to go for a better looking solution - So I changed the devise 'notice' alert html content to "agent updated". Lastly, I added a scroll up to the top of the page ability, so if the user is scrolled at the bottom, they can still see the notice. The notice displays, then dissapears after one second.

This was one of the harder tasks. There were many steps that needed to be taken before the whole thing worked like I wanted.

###Task4:
```shell
When new leads are created assign it to an agent using a “round robin” That way new leads are distributed evenly across all the agents.
```
###Notes:
I added a before_create callback inside the lead.rb file. Inside here, it assigns the newly created lead to an agent. The first newly created lead is assigned to the first agent (id=1). Then an increment kicks in, so the next lead is assigned to the next agent and so on. When the end is reached, ie the increment counter is greater than the number of agents in the table, it gets reassigned to the first agent again. In this way, newly created leads are distributed amonst agents evenly. 

This task looked easy the first time I read it, but it was trickier to figure out than I originally thought. 



###Task5:
```shell
Create some functionality so agents can log an activity they did while working with the lead. Thinks like logging an activity.
```
###Notes:
I created a new column inside the lead table, and ran a migration. Then I included this newly created column inside the strong_params. In the corresponding form, I made it a text_area instead of a text_field to allow for long logs. 

I wasnt 100% this is what was meant when you specifid an activity log, but hopefully its what you wanted! I thought about making it so that this activity log is only visible to the agent that the lead is assigned to, but thought it might be best for everyone to see (notes may be helpful to other agents as well)


###Task6: 
```shell
Any other changes or improvements you see as helpful to the application/test code. This is a pretty simple and hasty example application. Some things have been left out intentionally, others you may actually see a better way of accomplishing. Is there a better user experience? Can you see a possible refactoring? Are the tests brittle? Think of the entire codebase as malleable.
```
###Notes:
* I thought it might be helpful to let the signed in agent know that they are in fact signed in, as well as displaying their role. So I added a display nav bar that shows the agent thats signed in along with their role. This only shows if agent is signed in.
* I put the drop down agent options in the lead index and lead show pages inside a helper method within the leads_helper.rb file
* I also created a link to/routes for "Create New Lead", this is probably redundatnt as leads come from the api, but this was used mostly for testing purposes to make sure that the "round robin" was working. 
* I Set up API routes, for the show and index actions in addition to the create action. These might be handy in the future ? I just thought why not and included these in here for additional practice with JSON/APIs

