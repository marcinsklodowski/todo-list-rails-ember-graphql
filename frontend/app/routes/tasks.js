import Ember from 'ember';
import Route from '@ember/routing/route';

export default Route.extend({
  model: function () {
    return Ember.RSVP.hash({
      tasks: this.get('store').findAll('task')
    });
  },
  actions: {
    saveTask(post){
      post.save();
    },
    createTask(title){
      this.get('controller').get('store').createRecord('task', {
        title: title
      }).save();
      this.get('controller').set('title', '');
    },
    destroyTask(task){
      task.destroyRecord();
    }
  }
});
