###Real Geeks Rails Programmer Interview Project

```shell
An API endpoint for creating leads, to receive new leads, from our other services
```
Created a new controller for apis. Subfolder for v1. And three actions, I started off with the show and index actions, just to see if my method was working. ( I also created views for these in the views folder). Perhaps they can be of value? Then I went ahead and created the create action. I tested this using POSTMAN (which is a chrome extension). It works, obeying the "round robin" clause.

```shell
On the lead detail page (LeadsController#show) restrict the ability for regular agents to change who the lead is assigned to. It should only be allowed to admins
```
I added a simple if statement chekcing to see if the agent role is admin, if it is, then show the next part of the code. I later refactored this into a helper method called agent? inside the agent.rb file.

```shell
Allow admin agents to change who the lead is assigned to from the leads list page
(LeadsController#index) using a select dropdown type menu. This should update the server without reloading the page and give some sort of visual indication that the reassignment was successful.
```
First added a dropdown options (similar to how its set up inside the leads show page), added a submit button. It worked! Once this was done, in order to ensure that the page was not reloaded, i added remote:true inside the form, so it would process the submit as an ajax request. Then i created a update.js file. Inside there, I added alert("agent udpated") to let the user know that the agent was updated. Then I decided to go for a better soluetion. SO i changed the notice html conentent to "agent reassinged", and added scroll up to the top of the page so if the user is scrolled at the bottom, they can still see it.

```shell
When new leads are created assign it to an agent using a “round robin” That way new leads are distributed evenly across all the agents.
```
I added a before_create callback inside the lead.rb file. Inside here, it assigns the newly created lead to an agent. The first one is assigned to the first agent. Then its increented, so the next lead is assigned to the next agent and so on. When the end is reached, ie the increment counter is greater than the number of agents in the table, it gets reassigned to the first agent again.

```shell
Create some functionality so agents can log an activity they did while working with the lead. Thinks like logging an activity.
```
I created a new column inside the lead table, and ran a migration. Then I included this inside the strong_params. I made it a text_area instead of a text_form to allow for long logs. I want too sure what you meant by this one, but hopefully I did what you wanted!


```shell
Any other changes or improvements you see as helpful to the application/test code. This is a pretty simple and hasty example application. Some things have been left out intentionally, others you may actually see a better way of accomplishing. Is there a better user experience? Can you see a possible refactoring? Are the tests brittle? Think of the entire codebase as malleable.
```
* I thought it might be helpful to let the signed in agent know that they are in fact signed in, and their role. So I added a display nav bar that shows the agent thats signed in along with their role.
* Also I put the drop down agent options in the lead index and lead show pages inside a helper method within the leads_helper.rb file
* I also created a link to/routes for "Create New Lead", this is probably redundatnt as leads come from the api, but this was used mostly for testing purposes to make sure that the "round robin" was working
* Users were created using rails coneole. I was going to include a "sign up" button, but I thought it was probably left out for a reason. 
* Set up API routes, for show and index as well (just cause) they can be viewd at /api/controllers/ and api/controllers/:index

