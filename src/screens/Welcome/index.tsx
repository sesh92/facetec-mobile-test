import React from 'react';
import {StyleSheet, View} from 'react-native';
import {Button, Image, Text} from 'react-native-elements';

import Label from '../../assets/icons/label.svg';
import Logo from '../../assets/icons/logo.svg';
import Layout from '../../components/Layout';
import {useFaceTec} from '../../hooks/FaceTecSDKProvider';

const styles = StyleSheet.create({
  root: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'space-around',
  },
  header: {
    flexDirection: 'column',
    justifyContent: 'center',
    alignItems: 'center',
  },
  btn: {
    backgroundColor: '#666666',
  },
  btnAuthorized: {
    backgroundColor: '#88cc88',
  },
  imageSecret: {
    width: 150,
    height: 150,
  },
});

const WelcomeScreen: React.FC = () => {
  const {
    loading,
    initializationLoading,
    authorizationLoading,
    isAuthorized,
    secret,
    initialization,
    authorization,
  } = useFaceTec();

  return (
    <Layout>
      <View style={styles.root}>
        <View style={styles.header}>
          <Logo height={100} width={100} fill={'#666666'} />
          <Label height={100} width={100} />
          {isAuthorized && (
            <>
              <Text>This is my secret</Text>
              <Image style={styles.imageSecret} source={{uri: secret}} />
            </>
          )}
        </View>

        {!loading && (
          <>
            <Button
              loading={initializationLoading}
              disabled={authorizationLoading}
              buttonStyle={styles.btn}
              title="Initialization"
              onPress={initialization}
            />
            <Button
              loading={authorizationLoading}
              disabled={initializationLoading}
              buttonStyle={isAuthorized ? styles.btnAuthorized : styles.btn}
              title="Authorization"
              onPress={authorization}
            />
          </>
        )}
      </View>
    </Layout>
  );
};

export default WelcomeScreen;
