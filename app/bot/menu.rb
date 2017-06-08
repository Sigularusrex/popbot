Facebook::Messenger::Profile.set({
                                     get_started: {
                                         payload: 'GetStarted'
                                     },
                                     persistent_menu: [
                                         {
                                             locale: 'default',
                                             composer_input_disabled: true,
                                             call_to_actions: [
                                                 {
                                                     title: 'My Music',
                                                     type: 'postback',
                                                     payload: 'MyMusic'
                                                 }
                                             ]
                                         }
                                     ]
                                 }, access_token: ENV['ACCESS_TOKEN'])