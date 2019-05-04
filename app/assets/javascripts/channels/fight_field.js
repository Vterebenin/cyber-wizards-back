App.fight_field = App.cable.subscriptions.create('FightFieldChannel', {
  connected: function() {},
  disconnected: function() {},
  received: function(data) {
    return $('#messages').append(data['message']);
  },
  speak: function(message) {
    return this.perform('speak', {
      message: message
    });
  }
}, $(document).on('keypress', '[data-behavior~=fight_field_speaker]', function(event) {
  if (event.keyCode === 13) {
    App.fight_field.speak(event.target.value);
    console.log('123');
    event.target.value = '';
    return event.preventDefault();
  }
}));
