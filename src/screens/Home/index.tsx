import React from 'react';
import {StyleSheet, Text} from 'react-native';

import Layout from '../../components/Layout';

const styles = StyleSheet.create({
  text: {
    color: 'black',
  },
});

const HomeScreen: React.FC = () => (
  <Layout>
    <Text style={styles.text}>Home screen</Text>
  </Layout>
);

export default HomeScreen;
