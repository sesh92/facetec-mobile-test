import React from 'react';
import {Text, View, StyleSheet} from 'react-native';

import Layout from '../../components/Layout';

const styles = StyleSheet.create({
  text: {
    color: 'black',
  },
});

const ProfileScreen: React.FC = () => (
  <Layout>
    <View>
      <Text style={styles.text}>Profile screen</Text>
    </View>
  </Layout>
);

export default ProfileScreen;
