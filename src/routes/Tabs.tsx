import {
  BottomTabBar,
  createBottomTabNavigator,
} from '@react-navigation/bottom-tabs';
import {NavigatorScreenParams} from '@react-navigation/native';
import React from 'react';
import {Icon} from 'react-native-elements';

import HomeScreen from '../screens/Home';
import ProfileScreen from '../screens/Profile';

type TabParamList = {
  Home: {};
  Profile: {};
};

const TabsStack = createBottomTabNavigator<TabParamList>();

export type TabsNavigation = NavigatorScreenParams<TabParamList>;

const Tabs = () => {
  return (
    <TabsStack.Navigator
      tabBar={props => <BottomTabBar {...props} />}
      screenOptions={{
        headerShown: false,
      }}>
      <TabsStack.Screen
        name="Home"
        component={HomeScreen}
        options={{
          tabBarIcon: () => <Icon color="#666666" name="home" />,
          tabBarLabel: 'Home',
        }}
      />
      <TabsStack.Screen
        name="Profile"
        component={ProfileScreen}
        options={{
          tabBarIcon: () => <Icon color="#666666" name="account-circle" />,
          tabBarLabel: 'Profile',
        }}
      />
    </TabsStack.Navigator>
  );
};

export default Tabs;
