data Proposal = Proposal
    { ProposalData      :: BuiltinByteString
    }
    deriving stock (Haskell.Show, Generic)
    deriving anyclass (ToJSON, FromJSON)

data Voting = Voting
    { proposal :: Proposal
    , votes    :: AssocMap.Map TokenName Bool
    }
    deriving stock (Haskell.Show, Generic)
    deriving anyclass (ToJSON, FromJSON)

data GovState = GovState
    { law    :: BuiltinByteString
    , mph    :: MintingPolicyHash
    , voting :: Maybe Voting
    }
    deriving stock (Haskell.Show, Generic)
    deriving anyclass (ToJSON, FromJSON)

data GovInput
    = AddProposal Proposal
    | FinishProposal
    | AddVote TokenName Bool
    | FinishVoting
    deriving stock (Haskell.Show, Generic)
    deriving anyclass (ToJSON, FromJSON)