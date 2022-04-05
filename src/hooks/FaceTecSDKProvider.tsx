import React, {createContext, useContext} from 'react';

import useFaceTecModule from './modules/useFacetecModule';

type Context = {
  authToken?: string;
  livenessConfirmed?: boolean;
  isAuthorized?: boolean;
  secret?: string;
  loading?: boolean;
  initializationLoading?: boolean;
  authorizationLoading?: boolean;
  authorization?: () => Promise<void>;
  initialization?: () => Promise<void>;
};

export const FaceTecContext = createContext<Context>({});
export const useFaceTec = () => useContext(FaceTecContext);

const FaceTecSDKProvider: React.FC = ({children}) => {
  const {
    isAuthorized,
    loading,
    initializationLoading,
    authorizationLoading,
    secret,
    authorization,
    initialization,
  } = useFaceTecModule();

  return (
    <FaceTecContext.Provider
      value={{
        isAuthorized,
        loading,
        initializationLoading,
        authorizationLoading,
        secret,
        initialization,
        authorization,
      }}>
      {children}
    </FaceTecContext.Provider>
  );
};

export default FaceTecSDKProvider;
