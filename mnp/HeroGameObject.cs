using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace MAP.COMBAT
{
    public class HeroGameObject : MonoBehaviour
    {
#pragma warning disable 649

        [SerializeField]
        private MAP.CORE.Hero_Data m_heroData;

        [SerializeField]
        private MAP.CORE.Hero_Base_Skill m_heroSkill;

#pragma warning restore 649

        private HeroUI m_heroUI;
        private int m_prevHealth;

        private void Awake()
        {

        }
        // Start is called before the first frame update
        void Start()
        {
            // TODO
            // load save data with hero level, hero ID etc
            // load hero base data,

            m_heroData.OnValidate();
            m_heroData.BaseData.HeroSkill_Base_Data.LoadSkillData(m_heroData.BaseData.Skill_ID);
            m_heroSkill.Initialize(m_heroData.BaseData.HeroSkill_Base_Data);
        }

        // Update is called once per frame
        void Update()
        {
        
        }

        public void SetHeroUI(HeroUI _heroUI)
        {
            m_heroUI = _heroUI;
            m_heroUI.SetElement(m_heroData.BaseData.Hero_Element);
            m_heroUI.SetHealth(m_heroData.Current_HP, m_heroData.Max_HP);
            m_heroUI.SetMana(0, m_heroData.BaseData.MaxMana);
        }

        public void CastSkill(EnemyGameObject _target, CombatSkillsHelper _skillHelper)
        {
            PreBuffStep();
            
            m_heroUI.SetMana(m_heroData.Current_Mana, m_heroData.BaseData.MaxMana);
            
            _skillHelper.SetCaster(this);
            _skillHelper.SetTarget(_target);

            m_heroSkill.ProcessBuffOn_Start(m_heroData, _skillHelper);

            OnPreSkill();

            ApplyBuffStep();

            PostBuffStep();
        }

        /// <summary>
        /// on hero turn start
        /// </summary>
        public void OnTurnStart()
        {
            PreBuffStep();

            Debug.Log("Hero TURN_START");
            m_heroSkill.ProcessBuffOn_Step(CORE.Combat_Step.TURN_START);

            ApplyBuffStep();

            PostBuffStep();
        }

        /// <summary>
        /// on hero turn end
        /// </summary>
        public void OnTurnEnd()
        {
            PreBuffStep();

            Debug.Log("Hero TURN_END");
            m_heroSkill.ProcessBuffOn_Step(CORE.Combat_Step.TURN_END);

            m_heroSkill.ProcessBuffOn_End(m_heroData);

            ApplyBuffStep();

            PostBuffStep();
        }

        /// <summary>
        /// design not final, for now this is triggered when the player makes a match move
        /// </summary>
        public void OnAttack()
        {
            PreBuffStep();

            Debug.Log("Hero ON_Attack");
            m_heroSkill.ProcessBuffOn_Step(CORE.Combat_Step.ON_ATTACK);

            ApplyBuffStep();

            PostBuffStep();
        }

        /// <summary>
        /// triggered when match attack ends, there are no combos
        /// </summary>
        public void OnMatch()
        {
            PreBuffStep();

            Debug.Log("Hero ON_MATCH");
            m_heroSkill.ProcessBuffOn_Step(CORE.Combat_Step.ON_MATCH);

            ApplyBuffStep();

            PostBuffStep();
        }

        /// <summary>
        /// when the hero casts a skill
        /// </summary>
        public void OnPreSkill()
        {
            PreBuffStep();

            Debug.Log("Hero PRE_SKILL");
            m_heroSkill.ProcessBuffOn_Step(CORE.Combat_Step.PRE_SKILL);

            PostBuffStep();
        }

        public MAP.CORE.IBuffableStatObject GetBuffableStatObject()
        {
            return m_heroData;
        }

        public int GetCurrentAttack()
        {
            return m_heroData.Current_Attack;
        }

        public bool IsManaFull()
        {
            return m_heroData.Current_Mana >= m_heroData.BaseData.MaxMana;
        }
        
        public MAP.CORE.Element GetHeroElement()
        {
            return m_heroData.BaseData.Hero_Element;
        }

        public void TakeDamage(int damage)
        {
            m_heroData.Current_HP = System.Math.Max(m_heroData.Current_HP - damage, 0);
            if ( m_heroData.Current_HP > m_heroData.Max_HP )
            {
                m_heroData.Current_HP = m_heroData.Max_HP;
            }
            m_heroUI.SetHealth(m_heroData.Current_HP, m_heroData.Max_HP);
        }

        public void GainMana()
        {
            m_heroData.Current_Mana = System.Math.Min(m_heroData.Current_Mana + (int)m_heroData.BaseData.Mana_Regen, m_heroData.BaseData.MaxMana);
            m_heroUI.SetMana(m_heroData.Current_Mana, m_heroData.BaseData.MaxMana);
        }

        public bool IsDead()
        {
            return m_heroData.Current_HP <= 0;
        }


        /// <summary>
        /// for updating UI after buff applies
        /// </summary>
        private void PreBuffStep()
        {
            m_prevHealth = m_heroData.Current_HP;
        }
        private void ApplyBuffStep()
        {
            if ( m_heroData.DamageBuff != 0 )
            {
                TakeDamage(m_heroData.DamageBuff);
            }
            if ( m_heroData.HealthBuff != 0 )
            {
                TakeDamage(-m_heroData.HealthBuff);
            }
            m_heroData.DamageBuff = 0;
            m_heroData.HealthBuff = 0;
        }
        /// <summary>
        /// for updating UI after buff applies
        /// </summary>
        private void PostBuffStep()
        {
            if (m_prevHealth != m_heroData.Current_HP)
            {
                m_heroUI.SetHealth(m_heroData.Current_HP, m_heroData.Max_HP);
            }
        }
    }
}