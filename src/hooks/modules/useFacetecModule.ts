import {useCallback, useEffect, useState} from 'react';
import {NativeModules} from 'react-native';

const Facetec = NativeModules.Facetec as Facetec;

interface Facetec {
  setup: (theme?: string) => Promise<void>;
  initialization: () => Promise<[boolean, string]>;
  authorization: () => Promise<[boolean, string]>;
}

const useFaceTecModule = () => {
  const [setup, setSetup] = useState(false);
  const [isAuthorized, setIsAuthorized] = useState(false);
  const [secret, setSecret] = useState<string>();
  const [loading, setLoading] = useState(!setup);
  const [initializationLoading, setInitializationLoading] = useState(!setup);
  const [authorizationLoading, setAuthorizationLoading] = useState(!setup);

  useEffect(() => {
    setLoading(true);
    (async () => {
      await Facetec.setup('Config Wizard Theme');

      setSetup(true);
      setInitializationLoading(false);
      setAuthorizationLoading(false);
      setLoading(false);
    })();
  }, []);

  const initialization = useCallback(async () => {
    if (!setup) {
      throw new Error("Facetec hasn't been setup");
    }

    if (loading || authorizationLoading) {
      throw new Error('Facetec is not ready');
    }

    setInitializationLoading(true);
    await Facetec.initialization();
    setInitializationLoading(false);
  }, [authorizationLoading, setup, loading]);

  const authorization = useCallback(async () => {
    if (!setup) {
      throw new Error("Facetec hasn't been setup");
    }

    if (loading || initializationLoading) {
      throw new Error('Facetec is not ready');
    }

    setAuthorizationLoading(true);
    const [success, _secret] = await Facetec.authorization();
    setAuthorizationLoading(false);
    setIsAuthorized(false);

    if (!success) {
      return;
    }

    setSecret(_secret);
    setIsAuthorized(true);
  }, [initializationLoading, setup, loading]);

  return {
    secret,
    isAuthorized,
    loading,
    initializationLoading,
    authorizationLoading,
    authorization,
    initialization,
  };
};

export default useFaceTecModule;
