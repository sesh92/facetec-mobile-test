import {NavigationProp} from '@react-navigation/native';
import {createStackNavigator, TransitionPresets} from '@react-navigation/stack';
import React from 'react';

import WelcomeScreen from '../screens/Welcome';
import Tabs, {TabsNavigation} from './Tabs';

export type RootStackParamList = {
  Welcome: {};
  Tabs: TabsNavigation;
};

export const RootStack = createStackNavigator<RootStackParamList>();

export type RootNavigation = NavigationProp<RootStackParamList>;

const Routes: React.FC = () => {
  return (
    <RootStack.Navigator initialRouteName="Welcome">
      <RootStack.Screen
        name="Tabs"
        component={Tabs}
        options={{
          headerShown: false,
          ...TransitionPresets.ModalSlideFromBottomIOS,
        }}
      />
      <RootStack.Screen
        name="Welcome"
        component={WelcomeScreen}
        options={{headerShown: false}}
      />
    </RootStack.Navigator>
  );
};

export default Routes;
