// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import CreateTaskController from "./create_task_controller"
application.register("create-task", CreateTaskController)

import EditInTaskController from "./edit_in_task_controller"
application.register("edit-in-task", EditInTaskController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import SortableController from "./sortable_controller"
application.register("sortable", SortableController)
