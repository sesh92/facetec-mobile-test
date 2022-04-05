import React from 'react';
import {StyleSheet, View} from 'react-native';
import {SafeAreaView} from 'react-native-safe-area-context';

const styles = StyleSheet.create({
  root: {
    height: '100%',
    justifyContent: 'center',
    alignItems: 'center',
  },
});

const Layout: React.FC = ({children}) => (
  <SafeAreaView>
    <View style={styles.root}>{children}</View>
  </SafeAreaView>
);

export default Layout;
