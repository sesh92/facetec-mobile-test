import {NavigationContainer} from '@react-navigation/native';
import React from 'react';
import {SafeAreaProvider} from 'react-native-safe-area-context';

import FaceTecSDKProvider from './hooks/FaceTecSDKProvider';
import Routes from './routes';

const App = () => {
  return (
    <FaceTecSDKProvider>
      <SafeAreaProvider>
        <NavigationContainer>
          <Routes />
        </NavigationContainer>
      </SafeAreaProvider>
    </FaceTecSDKProvider>
  );
};

export default App;
