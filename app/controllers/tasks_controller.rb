class TasksController < ApplicationController

    # show all tasks
    def index
        @tasks = Task.all
    end

    # show one task
    def show
        @task = Task.find(params[:id])
    end

    # create a new task
    def new
        @task = Task.new # needed to instantiate the form_for
    end

    def create
        @task = Task.new(task_params)
        @task.save

        # no need for app/views/tasks/create.html.erb
        redirect_to task_path(@task)

    end

    # edit a task
    def edit
        @task = Task.find(params[:id])
    end

    def update
        @task = Task.find(params[:id])
        @task.update(task_params)

        # no need for app/views/restaurants/update.html.erb
        redirect_to task_path(@task)
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy

        # no need for app/views/tasks/destroy.html.erb
        redirect_to tasks_path
    end

end



private

def task_params
    params.require(:task).permit(:title, :details, :completed)
end
